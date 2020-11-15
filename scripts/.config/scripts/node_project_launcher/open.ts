import { exec } from 'https://cdn.depjs.com/exec/mod.ts'
import { existsSync } from "https://deno.land/std@0.77.0/fs/mod.ts";

const PROJECT_NAME = Deno.args[1]
const CURRENT_DIR = Deno.args[0]

console.log({CURRENT_DIR, PROJECT_NAME})

function handleArgs(args: string[]) {
  args.forEach( async (arg: string) => {
    if(arg === '-i') {
      project.install()
    } else if (arg === '-e') {
      await project.install()
      await project.editor()
      // await project.server("split right")
      // await exec(`tmux select-pane -l`)
      // await exec(`tmux attach-session -t ${PROJECT_NAME}`)
    } 
  })
}

const project = {
  install: async () => {
    const isPathExist = existsSync("node_modules")
    if(!isPathExist) await exec({ cmd: ['yarn install --prefer-offline'], cwd: CURRENT_DIR } )
    else console.log("-> node_modules already installed")
  },
  editor: async () => {
    if(! await tmux.checkForSession(PROJECT_NAME)) {
      await tmux.startNewSession(PROJECT_NAME, "code", "nvim")
    }
  },
  server: async (location: string) => {
   // if(! await tmux.checkForSession(PROJECT_NAME)) {
   //    await tmux.startNewSession(PROJECT_NAME, "code", "")
   // }
   if (location === 'split right') {
      await tmux.openNewSplit("right")
      // await exec({ cmd: [`tmux resize-pane -R 30`], cwd: CURRENT_DIR })
      // await exec({ cmd: ["tmux send -t code.1 yarn SPACE start ENTER"], cwd: CURRENT_DIR })
    } else {
      await tmux.openNewWindow("server", "yarn start")
    }
  }
}

const tmux = {
  checkForSession: async (sessionName: string): Promise<boolean> => {
    const doesSessionExist = (await exec({ cmd: [`tmux has-session -t ${sessionName} 2>/dev/null`], cwd: CURRENT_DIR })) === '' 
      ? false : true
    return doesSessionExist
  },
  startNewSession: async (sessionName: string, windowName: string, command: string): Promise<void> => {
    await exec({ cmd: [`tmux new -d -s ${sessionName} -n ${windowName} ${command}`], cwd: CURRENT_DIR })
    console.log(`-> New Session: ${sessionName}`)
  },
  openNewSplit: async (direction: 'right' | 'down') => {
    await exec({ cmd: [`tmux split-window ${direction === 'right' ? '-h' : ''}`], cwd: CURRENT_DIR })
  },
  openNewWindow: async (windowName: string, command: string) => {
    await exec({ cmd: [`tmux new-window ${windowName} ${command}`], cwd: CURRENT_DIR })
  }
}

handleArgs(Deno.args)

