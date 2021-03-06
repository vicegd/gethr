% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/shh.R
\name{shh_generateSymKeyFromPassword}
\alias{shh_generateSymKeyFromPassword}
\title{Symmetric key generation and storage.}
\usage{
shh_generateSymKeyFromPassword(password)
}
\arguments{
\item{password}{String - Password used to generate the symmetric key.}
}
\value{
String - Symmetric key ID on sucess.
}
\description{
\code{shh_generateSymKeyFromPassword} stores the symmetric key, and returns
its ID.
}
\examples{
\donttest{
shh_generateSymKeyFromPassword('my_password')
}

}
\seealso{
Other shh functions: \code{\link{gethr}},
  \code{\link{shh_addPrivatekey}},
  \code{\link{shh_addSymKey}},
  \code{\link{shh_deleteKeyPair}},
  \code{\link{shh_deleteSymKey}},
  \code{\link{shh_getPrivateKey}},
  \code{\link{shh_getPublicKey}},
  \code{\link{shh_getSymKey}},
  \code{\link{shh_hasKeyPair}},
  \code{\link{shh_hasSymKey}}, \code{\link{shh_info}},
  \code{\link{shh_markTrustedPeer}},
  \code{\link{shh_newKeyPair}},
  \code{\link{shh_newMessageFilter}},
  \code{\link{shh_newSymKey}}, \code{\link{shh_post}},
  \code{\link{shh_setMaxMessageSize}},
  \code{\link{shh_setMinPoW}}, \code{\link{shh_version}}
}
\concept{shh functions}
