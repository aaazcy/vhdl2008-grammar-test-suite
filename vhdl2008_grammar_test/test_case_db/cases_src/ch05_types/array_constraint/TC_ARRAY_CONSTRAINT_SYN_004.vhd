-- =============================================================
-- Case ID: TC_ARRAY_CONSTRAINT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_constraint ::= index_constraint [ array_element_constraint ] | ( open ) [ array_element_constraint ]
-- Case Type: Positive
-- Test Focus: Array constraint with element constraint on nested array of arrays — exercises array_element_constraint within array_constraint
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity array_ctr_elem_constraint is
  port(
    clk       : in  bit;
    byte_out  : out bit_vector(7 downto 0)
  );
end entity;

architecture nested_array_test of array_ctr_elem_constraint is
  type t_nibble_arr is array (natural range <>) of bit_vector(3 downto 0);
  type t_byte_pairs is array (natural range <>) of t_nibble_arr(0 to 1);
  subtype t_byte_pair8 is t_byte_pairs(0 to 7);
  signal store : t_byte_pair8 := (others => (others => x"0"));
  signal idx   : natural range 0 to 7 := 0;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      store(idx)(0) <= store(idx)(0)(2 downto 0) & '1';
      store(idx)(1) <= store(idx)(1)(2 downto 0) & '0';
      byte_out <= store(idx)(0) & store(idx)(1);
      if idx = 7 then idx <= 0;
      else idx <= idx + 1; end if;
    end if;
  end process;
end architecture;
