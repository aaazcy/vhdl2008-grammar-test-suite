-- =============================================================
-- Case ID: TC_CONSTANT_DECLARATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: CONSTANT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4
-- Test Focus: Constant declaration: constant identifier {,identifier} : subtype_indication [:= expression]; — with and without init
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_constant_declaration_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_constant_declaration_syn_s01 is
  constant C_DEF:integer:=42;
  constant C_NODEF:integer:=0;  -- deferred, full in package body
  constant C_A,C_B:bit:='0';  -- multi-identifier
begin
  r<=C_DEF;end architecture bh;
