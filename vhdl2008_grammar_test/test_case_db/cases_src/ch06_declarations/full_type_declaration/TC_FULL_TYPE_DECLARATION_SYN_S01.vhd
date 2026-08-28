-- =============================================================
-- Case ID: TC_FULL_TYPE_DECLARATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: FULL_TYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Test Focus: Full type declaration: type identifier is type_definition; — complete type declaration (contrast with incomplete)
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_full_type_declaration_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_full_type_declaration_syn_s01 is
  type t_ftd is record x:integer; y:bit_vector(0 to 7); end record;
  signal s_ftd:t_ftd;
begin
  s_ftd.x<=42; r<=s_ftd.x;end architecture bh;
