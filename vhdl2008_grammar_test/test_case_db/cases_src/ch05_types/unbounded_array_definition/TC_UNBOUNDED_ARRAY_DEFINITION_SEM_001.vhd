-- =============================================================
-- Case ID: TC_UNBOUNDED_ARRAY_DEFINITION_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_UNBOUNDED_ARRAY_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: unbounded_array_definition ::=
--   array ( index_subtype_definition { , index_subtype_definition } )
--   of element_subtype_indication
-- Case Type: Positive
-- Test Focus: Semantic: unbounded array used as a generic vector
--            processing unit. Supports variable-length vectors
--            through the box notation. A dot-product accumulator
--            for configurable vector width.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dot_product_accumulator is
  port (
    clk    : in  bit;
    a_in   : in  integer range -128 to 127;
    b_in   : in  integer range -128 to 127;
    idx    : in  integer range 0 to 7;
    result : out integer range -32768 to 32767
  );
end entity dot_product_accumulator;

architecture rtl of dot_product_accumulator is
  -- unbounded_array_definition
  type vec_data is array (integer range <>) of integer range -128 to 127;
  subtype vec8 is vec_data(0 to 7);
  signal a_vec : vec8 := (others => 0);
  signal b_vec : vec8 := (others => 0);
  signal accum : integer range -32768 to 32767 := 0;
begin
  process(clk)
    variable dot_sum : integer range -32768 to 32767 := 0;
  begin
    if clk'event and clk = '1' then
      a_vec(idx) <= a_in;
      b_vec(idx) <= b_in;
      dot_sum := 0;
      for i in 0 to 7 loop
        dot_sum := dot_sum + a_vec(i) * b_vec(i);
      end loop;
      result <= dot_sum;
    end if;
  end process;
end architecture rtl;
