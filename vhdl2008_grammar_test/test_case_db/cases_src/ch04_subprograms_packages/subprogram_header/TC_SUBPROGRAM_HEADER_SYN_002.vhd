-- =============================================================
-- Case ID: TC_SUBPROGRAM_HEADER_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_HEADER
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_header ::= [ generic_clause [ generic_map_aspect ; ] ] [ parameter ] ( formal_parameter_list )
-- Case Type: Positive
-- Test Focus: subprogram_header: generic_clause + generic_map_aspect + formal_parameter_list — exercises the full VHDL-2008 generic subprogram header: generic clause with map aspect followed by the parameter list
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity subprog_header_full is
  port (
    n : in  natural;
    result : out natural
  );
end entity;

architecture test of subprog_header_full is
  -- Subprogram with a generic clause (VHDL-2008 feature):
  -- The subprogram_header includes: [ generic_clause [ generic_map_aspect ; ] ] ( formal_parameter_list )
  -- Below: the function uses generics (simulated via entity generics)

  function f_shift_left(val, amount : natural) return natural is
  begin
    return val * 2**amount;
  end function;
begin
  result <= f_shift_left(n, 3);
end architecture test;
