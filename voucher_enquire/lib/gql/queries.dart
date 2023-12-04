const workerEnquire = r"""
query workerEnquire ($nationalId: String!){
  insurees (chfId: $nationalId, validityTo_Isnull: true) {
    edges {
      node {
        chfId
        otherNames
        lastName
      }
    }
  }
  enquireWorker (nationalId: $nationalId) {
    edges{
      node{
        status,
    		code,
        assignedDate,
        expiryDate,
        dateUpdatedAsDate
    		insuree	{
      		chfId
    		}
        policyholder {
          code
          tradeName
        }
    	}
  	}
  }
}
""";
