https://chadstechnoworks.com/wptech/db/how_to_install_oracle_12c_database_software.html#Install_Oracle_DB


 projadd -p 300 -c "Oracle Project" \
       -K "project.max-shm-memory=(priv,10737418240,deny)" \
       -K "process.max-sem-nsems=(priv,1024,deny)" oracle


groupadd -g 1001 oinstall
groupadd -g 1002 dba


useradd -g oinstall -G dba -p oracle -K "project=oracle" -m \
      -s /bin/bash -d /export/home/oracle -c "Oracle Account" -u 2001 oracle



mkdir -p /oem/app/oraemdb
chown -R oracle:oinstall /oem/app


su - oracle

vi oraenv_oemdb.sh
  ORACLE_SID=OMRDB ; export ORACLE_SID
  ORACLE_UNQNAME=OMRDB ; export ORACLE_UNQNAME
  ORACLE_BASE=/oem/app/oraemdb ; export ORACLE_BASE
  ORACLE_HOME=$ORACLE_BASE/product/12.1.0.1/db ; export ORACLE_HOME
  ORAINST=$ORACLE_HOME/oraInst.loc ; export ORAINST
  TNS_ADMIN=$ORACLE_HOME/network/admin ; export TNS_ADMIN
  PATH=$PATH:$ORACLE_HOME/bin ; export PATH
  EDITOR=vi ; export EDITOR
  TMPDIR=$ORACLE_BASE/tmp ; export TMPDIR
  if [ ! -f $TMPDIR ];
  then
    mkdir -p $TMPDIR
  fi

  echo ------- DATABASE ENV -------
  echo ORACLE_BASE=$ORACLE_BASE
  echo ORACLE_HOME=$ORACLE_HOME
  echo ORACLE_SID=$ORACLE_SID
  echo ORACLE_UNQNAME=$ORACLE_UNQNAME
  echo ORAINST=$ORAINST
  echo TNS_ADMIN=$TNS_ADMIN
  echo TMPDIR=$TMPDIR    
  echo  

