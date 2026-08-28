-- =============================================================
-- Case ID: TC_IDENTIFIER_LIST_SYN_S01
-- Rule Type: Syntax
-- BNF Production: IDENTIFIER_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.4
-- Test Focus: Identifier list: identifier {, identifier} — comma-separated identifiers in declarations
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_identifier_list_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_identifier_list_syn_s01 is
  signal a,b,c,d:integer:=0;  -- identifier_list "a,b,c,d"
begin
  a<=1; b<=2; c<=3; d<=4; r<=a+b+c+d;end architecture bh;
