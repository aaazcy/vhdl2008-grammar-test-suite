-- =============================================================
-- Case ID: TC_VARIABLE_DECLARATION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_VARIABLE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.4
-- Production: variable_declaration ::= [ shared ] variable identifier_list : subtype_indication [ := expression ] ;
-- Case Type: Positive
-- Test Focus: Exercises variable_declaration within a process with initial value, used in a hardware accumulator.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity variable_decl_syn2 is
  port (
    clk    : in  bit;
    rst_n  : in  bit;
    data   : in  bit_vector(7 downto 0);
    accum  : out integer range -32768 to 32767
  );
end entity variable_decl_syn2;

architecture rtl of variable_decl_syn2 is
  function to_integer(v : bit_vector(7 downto 0)) return integer is
    variable result : integer := 0;
  begin
    for i in 0 to 7 loop
      if v(i) = '1' then
        result := result + 2**i;
      end if;
    end loop;
    return result;
  end function;
begin
  process(clk, rst_n)
    variable v_accum : integer range -32768 to 32767 := 0;
    variable v_count : integer range 0 to 255 := 0;
  begin
    if rst_n = '0' then
      v_accum := 0;
      v_count := 0;
    elsif clk'event and clk = '1' then
      v_accum := v_accum + to_integer(data);
      v_count := v_count + 1;
    end if;
    accum <= v_accum;
  end process;
end architecture rtl;
