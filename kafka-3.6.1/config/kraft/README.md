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
