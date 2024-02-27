<img src="https://capsule-render.vercel.app/api?type=Waving&color=auto&height=300&section=header&text=Kafka3.6.1(Kraft%20Using)&fontSize=50" />

<details>
<summary>
  카프카 클러스터 코디네이터 역할을 하는 Zookeeper를 걷어낸 버전
</summary>
</details>

<div>1) 기존 주키퍼의 외부 메타데이터 관리에 이슈가 있어 Kafka 내부에 쿼럼 컨트롤러 서비스 사용</div>
<div>2) 컨트롤러 Fail Over 조치를 거의 즉각적으로 수행</div>
<div>3) Kafka가 시스템에 대한 단일보안 모델을 가질 수 잇도록 허용</div>
<div>4) 소프트웨어를 단순화하여 안정성을 향상시키고 모니터링 및 시스템 관리를 쉽고 편리하게 할 수 있음</div>

<b></b>

<details>
<summary>
  설치/구성
</summary>
   
</details>
<div>※ 설정환경 : </div>
<div>	1) OS : RHEL 8.6</div>
<div> 2) JDK 21</div>
<div>	3) Kafka 3.6.1</div>
<div>※ 설정경로 : ${KAFKA_HOME}/config/kraft</div>

※ 클러스터 ID 생성
	${KAFKA_HOME}/bin/kafka-storage.sh random-uuid
	jaShGO9YR12vntLHlWQQBA
※ 스토리지 디렉토리 포맷 (주의 : 클러스터 끼리는 uuid 가 같아야함)
	${KAFKA_HOME}/bin/kafka-storage.sh format -t jaShGO9YR12vntLHlWQQBA -c ./config/kraft/server-1.properties
	
※ server.properties 변경
1) 브로커 아이디 유니크 값 기재
node.id=1 
2) 쿼럼 컨트롤러 설정 (ex : id@쿼럼IP:PORT)
controller.quorum.voters=1@localhost:9093,2@localhost:9083,3@localhost:9073
3) 메시지 경로 
log.dirs=/logs/ossmwap1/kafka/broker-1
log.dirs=/logs/ossmwap1/kafka/broker-2
log.dirs=/logs/ossmwap1/kafka/broker-3
