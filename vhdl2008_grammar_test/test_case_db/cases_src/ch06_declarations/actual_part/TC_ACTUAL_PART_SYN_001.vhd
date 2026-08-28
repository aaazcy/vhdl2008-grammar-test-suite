-- =============================================================
-- Case ID: TC_ACTUAL_PART_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ACTUAL_PART
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: actual_part ::= actual_designator
--              | function_name ( actual_designator )
--              | type_mark ( actual_designator )
-- Case Type: Positive (Production-Specific)
-- Test Focus: actual_part — exercises the actual_designator and
--             function_name(actual_designator) alternatives in a
--             component instantiation (port map of a comparator).
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity actual_part_syn1 is
  port (
    clk      : in  bit;
    data_a   : in  integer range 0 to 15;
    data_b   : in  integer range 0 to 15;
    equal    : out bit
  );
end entity actual_part_syn1;

architecture arch of actual_part_syn1 is

  -- Comparator component with bit_vector ports
  component magnitude_cmp is
    port (
      x      : in  bit_vector(3 downto 0);
      y      : in  bit_vector(3 downto 0);
      eq     : out bit
    );
  end component;

  -- Pure function to convert integer to bit_vector
  function int_to_bv(i : integer range 0 to 15) return bit_vector is
    variable result : bit_vector(3 downto 0);
    variable temp   : integer := i;
  begin
    for idx in 0 to 3 loop
      if (temp mod 2) = 1 then
        result(idx) := '1';
      else
        result(idx) := '0';
      end if;
      temp := temp / 2;
    end loop;
    return result;
  end function int_to_bv;

  signal s_eq : bit;
  signal s_a_reg : integer range 0 to 15 := 0;
  signal s_b_reg : integer range 0 to 15 := 0;

begin

  s_a_reg <= data_a;
  s_b_reg <= data_b;

  -- actual_part = function_name(actual_designator):
  --   int_to_bv(s_a_reg) — function_name with signal_name as argument
  -- actual_part = actual_designator:
  --   data_b is used directly (though type mismatch would occur here,
  --   the focus is on actual_part syntax — int_to_bv(data_b) would also work)
  u_cmp : component magnitude_cmp
    port map (
      x  => int_to_bv(s_a_reg),
      y  => int_to_bv(s_b_reg),
      eq => s_eq
    );

  equal <= s_eq;

end architecture arch;
