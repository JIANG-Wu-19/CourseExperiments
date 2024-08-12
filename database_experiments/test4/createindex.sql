create clustered index netflow_s1
on [Netflow-MillionRecords] (idauto)

create index netflow_s2
on [Netflow-MillionRecords] (ipLayerProtocolCode)

create index netflow_s3
on [Netflow-MillionRecords] (parsedDate)
