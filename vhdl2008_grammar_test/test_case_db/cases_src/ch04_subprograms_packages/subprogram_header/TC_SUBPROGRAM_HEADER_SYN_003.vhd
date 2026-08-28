-- =============================================================
-- Case ID: TC_SUBPROGRAM_HEADER_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_HEADER
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_header ::= [ generic_clause [ generic_map_aspect ; ] ] [ parameter ] ( formal_parameter_list )
-- Case Type: Positive
-- Test Focus: subprogram_header: generic_clause without generic_map_aspect + formal_parameter_list — exercises generic_clause present with default parameters, no map aspect needed, plus a full parameter list
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity subprog_header_generic is
  generic (
    G_SCALE : natural := 1
  );
  port (
    raw_in : in  natural;
    scaled : out natural
  );
end entity;

architecture test of subprog_header_generic is
  -- Subprogram header with generic clause only (no generic_map_aspect):
  -- generic (G_SCALE : natural := 1)  ( formal_parameter_list )
  function f_apply_scale(val : natural) return natural is
  begin
    return val * G_SCALE;
  end function;
begin
  scaled <= f_apply_scale(raw_in);
end architecture test;
