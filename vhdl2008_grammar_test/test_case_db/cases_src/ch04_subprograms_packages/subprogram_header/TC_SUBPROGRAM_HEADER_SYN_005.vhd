-- =============================================================
-- Case ID: TC_SUBPROGRAM_HEADER_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_HEADER
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_header ::= [ generic_clause [ generic_map_aspect ; ] ] [ parameter ] ( formal_parameter_list )
-- Case Type: Positive
-- Test Focus: subprogram_header: procedure with multiple parameter classes (signal, constant, variable) — exercises that the formal_parameter_list can mix different parameter classes: signal, constant, and variable parameters
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity subprog_header_multi_class is
  port (
    clk       : in  bit;
    enable    : in  bit;
    threshold : in  natural;
    count     : buffer natural;
    active    : out bit
  );
end entity;

architecture test of subprog_header_multi_class is
  -- subprogram_header with mixed parameter classes
  -- procedure p_mixed(signal clk : in bit; constant thr : in natural; signal cnt : inout natural; signal act : out bit)

  procedure p_mixed(
    signal clk   : in  bit;
    constant thr : in  natural;
    signal cnt   : inout natural;
    signal act   : out bit
  ) is
  begin
    if clk'event and clk = '1' then
      if cnt < thr then
        cnt <= cnt + 1;
        act <= '0';
      else
        act <= '1';
      end if;
    end if;
  end procedure;

  signal s_active : bit := '0';
begin
  p_mixed(clk, threshold, count, s_active);
  active <= s_active;
end architecture test;
