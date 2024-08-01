const workerEnquire = r"""
query workerEnquire ($nationalId: String!){
  insurees (chfId: $nationalId, validityTo_Isnull: true) {
    edges {
      node {
        chfId
        otherNames
        lastName
        photo {
          photo
        }
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
