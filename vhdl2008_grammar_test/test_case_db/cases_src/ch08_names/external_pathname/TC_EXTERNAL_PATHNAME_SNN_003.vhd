-- =============================================================
-- Case ID: TC_EXTERNAL_PATHNAME_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_pathname ::= package_pathname | absolute_pathname | relative_pathname
-- Case Type: Negative
-- Test Focus: Invalid relative_pathname — bare '^' without required '.' separator.
--   The BNF requires { ^ . } partial_pathname where each upward step is '^.'
--   (caret-dot). A bare '^' without '.' is not a valid pathname_element separator.
-- Expected Result: Triggers syntax error (missing dot after ^)
-- Dependencies: None
-- =============================================================

entity ext_path_badup_e is
  port (
    err_flag : out bit
  );
end entity ext_path_badup_e;

architecture bh of ext_path_badup_e is
  -- ERROR: Caret '^' missing required '.' separator in relative pathname
  -- BNF requires { ^ . } — each ^ must be followed by '.'
  alias bad_rel is
    <<signal ^ parent_inst.ready : bit>>;
begin
  err_flag <= '0';
end architecture bh;
