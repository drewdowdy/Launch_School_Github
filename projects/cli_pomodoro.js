let completedPomodoros = 0;

process.on('SIGINT', () => {
  let pomodoros = completedPomodoros === 1 ? 'pomodoro' : 'pomodoros';

  console.log(`=== You completed ${completedPomodoros} ${pomodoros}. ===`);
  console.log('=== Goodbye! ===');
  
  process.exit(0);
})

const MILISECONDS_PER_SECOND = 1000;
const SECONDS_PER_MIN = 60;
const MILISECONDS_PER_MIN = MILISECONDS_PER_SECOND * SECONDS_PER_MIN;

function formatTime(totalSeconds) {
  let minutes = Math.floor(totalSeconds / SECONDS_PER_MIN);
  let seconds = totalSeconds % SECONDS_PER_MIN;

  const mm = String(minutes).padStart(2, '0');
  const ss = String(seconds).padStart(2, '0');

  return `${mm}:${ss}`;
}

function runTimer(label, durationSeconds, onComplete) {  
  const startTime = Date.now();

  const timer = setInterval(() => {
    const elapsedMilliseconds = Date.now() - startTime;
    const elapsedSeconds = Math.floor(elapsedMilliseconds / MILISECONDS_PER_SECOND);
    const remainingSeconds = durationSeconds - elapsedSeconds;
    const time = formatTime(remainingSeconds);
    
    process.stdout.write(`${label} remaining: ${time}\r`);

    if (remainingSeconds <= 0) {
      clearInterval(timer);
      console.log('');  // New line
      if (onComplete) onComplete();
    }
  }, 1000);
}

function pomodoroTimer() {
  let cycle = 0;
  let workDuration = 25 * SECONDS_PER_MIN;
  let shortBreakDuration = 5 * SECONDS_PER_MIN;
  let longBreakDuration = 30 * SECONDS_PER_MIN;

  function startWork() {
    console.log('=== Work time! ===');
    runTimer('Work', workDuration, () => {
      completedPomodoros += 1;
      cycle += 1;
      startBreak();
    })
  }

  function startBreak() {
    const isLongBreak = cycle % 4 === 0;
    const duration = isLongBreak ? longBreakDuration : shortBreakDuration;
    const label = isLongBreak ? 'Long Break' : 'Short Break';

    console.log(`=== Time for a ${label.toLowerCase()}! ===`);
    runTimer(label, duration, startWork);
  }

  startWork();
}

console.log('🍅 Welcome to Pomodoro Timer! Press CTRL+C to quit.');
pomodoroTimer();
