-- =============================================================
-- Case ID: TC_ABSOLUTE_PATHNAME_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ABSOLUTE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: absolute_pathname ::= . partial_pathname
-- Case Type: Positive
-- Test Focus: Absolute pathname concept — `. partial_pathname` starts with a dot and denotes an external name anchored at the root path, used in VHDL 2008 hierarchical references to locate a signal/variable/constant downward from the top level
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity abs_path_ent is port(y:out integer); end entity;
architecture bh of abs_path_ent is
  signal s_top:integer:=42;
begin
  -- In VHDL 2008: <<signal .abs_path_ent.bh.s_top : integer>>
  -- absolute_pathname = .abs_path_ent.bh.s_top (root-anchored)
  y<=s_top;
end architecture bh;
