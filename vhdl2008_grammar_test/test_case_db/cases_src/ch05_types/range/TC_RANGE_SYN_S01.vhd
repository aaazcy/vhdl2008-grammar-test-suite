-- =============================================================
-- Case ID: TC_RANGE_SYN_S01
-- Rule Type: Syntax (Production-Specific)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: range ::= range_attribute_name | simple_expression direction simple_expression
-- Test Focus: Production-specific test exercising both forms of the
--   range production side by side: (1) s_data'range (attribute_name
--   form) and (2) 0 to 7 (expression form). Verifies both
--   alternatives compile and produce equivalent iteration.
-- Expected Result: Compiles; result matches combined element count
-- Dependencies: None
-- =============================================================
entity range_both_forms is
  port (
    clk    : in  bit;
    result : out integer
  );
end entity range_both_forms;

architecture both_range_forms of range_both_forms is
  type t_data is array(0 to 7) of integer;
  signal s_data : t_data := (1,2,3,4,5,6,7,8);
  signal s_sum  : integer := 0;
begin
  process(clk)
    variable v_attr : integer := 0;
    variable v_expr : integer := 0;
  begin
    if clk'event and clk = '1' then
      -- Form 1: range_attribute_name
      for i in s_data'range loop
        v_attr := v_attr + s_data(i);
      end loop;
      -- Form 2: simple_expression direction simple_expression
      for i in 0 to 7 loop
        v_expr := v_expr + s_data(i);
      end loop;
      s_sum <= v_attr + v_expr;
    end if;
  end process;
  result <= s_sum;
end architecture both_range_forms;
