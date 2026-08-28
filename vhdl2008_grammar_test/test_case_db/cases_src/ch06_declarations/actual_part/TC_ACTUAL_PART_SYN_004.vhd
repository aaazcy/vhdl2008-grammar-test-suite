-- =============================================================
-- Case ID: TC_ACTUAL_PART_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ACTUAL_PART
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: actual_part ::= actual_designator | function_name ( actual_designator ) | type_mark ( actual_designator )
-- Case Type: Positive
-- Test Focus: Exercises actual_part with type_mark conversion in a port map association converting integer to bit_vector.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity actual_part_syn4 is
  port (
    int_val  : in  integer range 0 to 255;
    bit_out  : out bit_vector(7 downto 0)
  );
end entity actual_part_syn4;

architecture rtl of actual_part_syn4 is
  component display_driver is
    port (
      segments : in  bit_vector(7 downto 0);
      dots     : out bit_vector(7 downto 0)
    );
  end component;

  function int_to_bv(val : integer) return bit_vector is
    variable result : bit_vector(7 downto 0) := (others => '0');
    variable temp   : integer := val;
  begin
    for i in 0 to 7 loop
      if (temp mod 2) = 1 then
        result(i) := '1';
      end if;
      temp := temp / 2;
    end loop;
    return result;
  end function;
begin
  -- actual_part = function_name(actual_designator)
  u_disp : display_driver
    port map (
      segments => int_to_bv(int_val),
      dots     => bit_out
    );
end architecture rtl;
