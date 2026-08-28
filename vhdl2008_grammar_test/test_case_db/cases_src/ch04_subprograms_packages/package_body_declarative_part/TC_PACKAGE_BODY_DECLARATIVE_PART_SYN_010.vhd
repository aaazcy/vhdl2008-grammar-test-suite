-- =============================================================
-- Case ID: TC_PACKAGE_BODY_DECLARATIVE_PART_SYN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body_declarative_part ::= { package_body_declarative_item }
-- Case Type: Positive
-- Test Focus: package_body_declarative_part with file_declaration + type(access): file type and access type declared in body, verification of file-related declarations as declarative items
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_file_part is
  type t_line is access string;
end package pkg_file_part;
package body pkg_file_part is
  type t_char_file is file of character;
end package body pkg_file_part;
entity pbdp_file_ent is port(r:out integer); end entity;
architecture bh of pbdp_file_ent is begin r<=0; end architecture bh;
