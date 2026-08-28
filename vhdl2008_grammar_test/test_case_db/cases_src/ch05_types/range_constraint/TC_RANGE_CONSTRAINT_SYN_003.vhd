-- =============================================================
-- Case ID: TC_RANGE_CONSTRAINT_SYN_003
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: range_constraint ::= range range
-- Test Focus: Range constraint using attribute range form. The
--   subtype constraint "range t_arr'range" derives the range
--   from the attribute of an array type. Tests the attribute form
--   of range nested inside range_constraint.
-- Expected Result: Compiles; subtype matches signal range
-- Dependencies: None
-- =============================================================
entity range_constraint_attr_form is
  port (
    clk   : in  bit;
    val   : out integer
  );
end entity range_constraint_attr_form;

architecture attr_range_constraint of range_constraint_attr_form is
  type t_arr is array(0 to 15) of integer;
  signal s_arr : t_arr := (others => 0);
  -- range_constraint using attribute range
  subtype t_match is integer range t_arr'range;
  signal s_sub : t_arr;
begin
  process(clk)
    variable v : integer := 0;
  begin
    if clk'event and clk = '1' then
      for i in t_match'low to t_match'high loop
        s_sub(i) <= v;
        v := v + 1;
      end loop;
      val <= v;
    end if;
  end process;
end architecture attr_range_constraint;
