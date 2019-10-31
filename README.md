# git-gud
These benchmarks aim to show the fastest way to get information from git. Getting fast git info is particularly important if you are trying to add information to the PS1 property of a terminal. All the tests are conducted in the [git repo](https://github.com/git/git) and are the fastest of 5 executions.

### Git Current Branch
The fastest way to get a git repo's current branch is: `cat .git/HEAD | awk -F refs/heads/ '{ print $2; }'`


Try it yourself!
```
$ curl -sSL https://github.com/jareddlc/git-gud/raw/master/git-branch-current.sh | sh
```

Commands that need additional formatting without the formatting (base speed)

| Command               | Real Time |
| --------------------- |:---------:|
| git branch            | 0m0.015s  |
| git status            | 0m0.027s  |
| cat .git/HEAD         | 0m0.004s  |
| git symbolic-ref HEAD | 0m0.007s  |
| git name-rev HEAD     | 0m0.040s  |

Commands that need additional formatting

| Command                                                         | Real Time |
| --------------------------------------------------------------- |:---------:|
| git branch \| grep \* \| awk '{ $1=$1; print }' \| tr -d \"* \" | 0m0.016s  |
| git branch \| grep \* \| cut -d ' ' -f2-                        | 0m0.016s  |
| git branch \| sed -n '/\* /s///p'                               | 0m0.014s  |
| git status \| head -1 \| awk '{ print $3; }'                    | 0m0.026s  |
| cat .git/HEAD \| awk -F refs/heads/ '{ print $2; }'             | 0m0.004s  |
| git symbolic-ref HEAD \| awk -F refs/heads/ '{ print $2; }'     | 0m0.008s  |
| git name-rev HEAD \| awk '{ print $2; }'                        | 0m0.039s  |
| git describe --all \| awk -F heads/ '{ print $2; }'             | 0m0.016s  |

Commands that dont need additional formatting

| Command                         | Real Time |
| ------------------------------- |:---------:|
| git symbolic-ref --short HEAD   | 0m0.008s  |
| git name-rev --name-only HEAD   | 0m0.039s  |
| git rev-parse --abbrev-ref HEAD | 0m0.008s  |

#### Contributing

Have a faster method? Submit a pull request and add it to the benchmarks.

A