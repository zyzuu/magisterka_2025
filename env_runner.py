
import subprocess

commands_3_stage = ["comp", "elab", "run"]
commands_2_stage = ["comp", "run"]
tools_3_stage = ["questa", "cadence", "xilinx"]
tools_2_stage = ["aldec", "vcs"]

#tools_3_stage = ["questa"]
#tools_2_stage = ["aldec"]


cmds_tools_3_stage = [f"{cmd}_{tool}" for tool in tools_3_stage for cmd in commands_3_stage]
cmds_tools_2_stage = [f"{cmd}_{tool}" for tool in tools_2_stage for cmd in commands_2_stage]

def run(stages=3, num_of_tests=10):
  for seed in range(1, num_of_tests+1):
    if stages == 2:
      for i in range(0,len(cmds_tools_2_stage),2):
        subprocess.run(["make", cmds_tools_2_stage[i],cmds_tools_2_stage[i+1], f"SEED={seed}"])
    else:
      for i in range(0,len(cmds_tools_3_stage),3):
        subprocess.run(["make", cmds_tools_3_stage[i], cmds_tools_3_stage[i+1], cmds_tools_3_stage[i+2], f"SEED={seed}"])


if __name__ == "__main__":
  run(stages=3)
  run(stages=2)