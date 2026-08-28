-- =============================================================
-- Case ID: TC_ITERATION_SCHEME_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ITERATION_SCHEME
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: iteration_scheme ::= while condition | for parameter_specification
-- Case Type: Positive
-- Test Focus: for loop descending range: for i in 7 downto 0 loop — discrete_range uses the downto direction for descending traversal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity iter_syn4_ent is port(din:in integer; y:out integer); end entity;
architecture bh of iter_syn4_ent is
  type t_arr is array(0 to 7) of integer;
  signal s_arr : t_arr := (others => 0);
begin
  process(din) is
    variable v_sum : integer := 0;
  begin
    for i in 7 downto 0 loop
      s_arr(i) <= din + i;
      v_sum := v_sum + din + i;
    end loop;
    y <= v_sum;
  end process;
end architecture bh;
