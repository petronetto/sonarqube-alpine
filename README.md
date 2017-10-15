# Sonar Qube and Sonar Scanner in Alpine Linux
Sonar Qube 6.5
Sonar Runner 2.5.1
Alpine Linux 3.6  


# What is Sonar?

Sonar is a web based code quality analysis tool for Maven based Java projects. It covers a wide area of code quality check points which include: Architecture & Design, Complexity, Duplications, Coding Rules, Potential Bugs, Unit Test etc. Sonar has a rich set of features like what you would get with different tools such as Covertura, PMD, FindBugs, Check Styles combined.

# Getting started

## Using container

Simply run `docker-compose up -d` and go to `http:localhost:9000`.
Wait some seconds until Sonar is ready, and log with `admin` password `admin`.

Now, to perform the code analysis you will need run the Sonar runner, just use the  executable in container, running: `docker exec -it sonarquebe sonar-runner`. Wait until analysis finish and check in you dashboard in `http:localhost:9000`.

> Note that you will need a file to config sonar-runner, that file is `sonar-runner.properties`, there is all configs to perform you code analysis. See the example file and sample code for more information.


## Installing plugins

Sonar Qube comes with some plugins installed, but, if your language isn't available, go to Update Center in `http://localhost:9000/updatecenter/`


## Documentacion
For more information, access the Sonar Qube docs [Qube docs](https://docs.sonarqube.org/display/SONAR/Documentation) and [Sonar Runner](https://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner)


# License
[BSD 3-Clause](https://github.com/petronetto/sonarqube-alpine/blob/master/LICENSE)
```
BSD 3-Clause License

Copyright (c) 2017, Juliano Petronetto
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this
  list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice,
  this list of conditions and the following disclaimer in the documentation
  and/or other materials provided with the distribution.

* Neither the name of the copyright holder nor the names of its
  contributors may be used to endorse or promote products derived from
  this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
```
