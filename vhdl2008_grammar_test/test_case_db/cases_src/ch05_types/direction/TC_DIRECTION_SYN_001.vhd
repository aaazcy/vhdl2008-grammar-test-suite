-- =============================================================
-- Case ID: TC_DIRECTION_SYN_001
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: direction ::= to | downto
-- Test Focus: Uses "to" direction in integer type range and for-loop
--   iteration. The loop counter accumulates across the ascending range
--   0 to 15, verifying that "to" produces monotonically increasing
--   values.
-- Expected Result: Compiles and runs; result = 120
-- Dependencies: None
-- =============================================================
entity ascending_accumulator is
  port (
    start : in  bit;
    total : out integer
  );
end entity ascending_accumulator;

architecture to_direction of ascending_accumulator is
  type t_index is range 0 to 15;
begin
  process(start)
    variable sum : integer := 0;
  begin
    if start = '1' then
      for i in t_index'low to t_index'high loop
        sum := sum + integer(i);
      end loop;
      total <= sum;
    end if;
  end process;
end architecture to_direction;
