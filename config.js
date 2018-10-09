
/**
 * User Profile
 */
var profile = {
  nameIdFormat: 'urn:oasis:names:tc:SAML:2.0:nameid-format:transient',
  firstname: 'Saml',
  lastname: 'Jackson',
  email: 'saml.jackson@example.com',
  userName: 'saml.jackson@example.com',
}

/**
 * SAML Attribute Metadata
 */
var metadata = [{
  id: "firstname",
  optional: false,
  displayName: 'First Name',
  description: 'The given name of the user',
  multiValue: false
}, {
  id: "lastname",
  optional: false,
  displayName: 'Last Name',
  description: 'The surname of the user',
  multiValue: false
}, {
  id: "email",
  optional: false,
  displayName: 'E-Mail Address',
  description: 'The e-mail address of the user',
  multiValue: false
}];

module.exports = {
  user: profile,
  metadata: metadata
}
