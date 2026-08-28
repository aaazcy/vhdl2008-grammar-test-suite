-- =============================================================
-- Case ID: TC_SUBPROGRAM_HEADER_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_HEADER
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_header ::= [ generic_clause [ generic_map_aspect ; ] ] [ parameter ] ( formal_parameter_list )
-- Case Type: Positive
-- Test Focus: subprogram_header: parameterless procedure with only parenthesized empty parameter list — exercises the minimum required element of subprogram_header: ( formal_parameter_list ) with zero parameters
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity subprog_header_empty_params is
  port (
    trigger : in  bit;
    done    : out bit
  );
end entity;

architecture test of subprog_header_empty_params is
  -- Subprogram header with empty parameter list:
  -- procedure p_simple ;  (no parameters, no generics)
  -- This exercises the minimum subprogram_header case

  procedure p_set_done(signal d : out bit) is
  begin
    d <= '1';
  end procedure;
begin
  process(trigger) is
  begin
    if trigger = '1' then
      p_set_done(done);
    else
      done <= '0';
    end if;
  end process;
end architecture test;
