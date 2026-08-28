-- =============================================================
-- Case ID: TC_INCOMPLETE_TYPE_DECLARATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: INCOMPLETE_TYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Test Focus: Incomplete type declaration: type identifier; — forward type declaration (no definition yet)
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_incomplete_type_declaration_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_incomplete_type_declaration_syn_s01 is
  type t_inc;  -- incomplete type
  type t_ptr is access t_inc;  -- can reference before full definition
  type t_inc is record x:integer; y:bit; end record;  -- full definition
begin
  process is
    variable s_ptr:t_ptr;
  begin
    r<=42;
    wait;
  end process;
end architecture bh;
