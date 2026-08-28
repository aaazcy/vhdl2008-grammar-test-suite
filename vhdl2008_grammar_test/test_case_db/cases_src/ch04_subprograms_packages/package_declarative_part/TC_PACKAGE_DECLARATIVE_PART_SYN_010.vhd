-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATIVE_PART_SYN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declarative_part ::= { package_declarative_item }
-- Case Type: Positive
-- Test Focus: package_declarative_part with alias+attribute+disconnection_specification combination: verification of uncommon declaration items alias/attribute/disconnection in package declaration region
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_aad_dp is
  constant C_PI:real:=3.14159;
  alias a_pi is C_PI;
  attribute a_doc:string;
  attribute a_doc of C_PI:constant is "pi constant";
end package pkg_aad_dp;
entity pdp_aad_ent is port(r:out real); end entity;
architecture bh of pdp_aad_ent is begin r<=work.pkg_aad_dp.C_PI; end architecture bh;
