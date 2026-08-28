-- =============================================================
-- Case ID: TC_ATTRIBUTE_DECLARATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: ATTRIBUTE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.7
-- Test Focus: Attribute declaration: attribute identifier : type_mark; — user-defined attribute declarations
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_attribute_declaration_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_attribute_declaration_syn_s01 is
  attribute attr_loc : string;
  attribute attr_num : integer;
  attribute attr_enum : string;
begin
  r<=42;end architecture bh;
