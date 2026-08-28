-- =============================================================
-- Case ID: TC_RECORD_ELEMENT_CONSTRAINT_SYN_S01
-- Rule Type: Syntax (Production-Specific)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_element_constraint ::= record_element_simple_name element_constraint
-- Test Focus: Production-specific isolation: two record_element_constraint
--   instances shown side-by-side, both using index_constraint element
--   forms on bit_vector fields of different widths. Both follow the
--   simple_name + element_constraint BNF pattern.
-- Expected Result: Compiles; both constraint forms verified
-- Dependencies: None
-- =============================================================
entity rec_elem_constraint_isolated is
  port (
    clk    : in  bit;
    result : out integer
  );
end entity rec_elem_constraint_isolated;

architecture isolate_elem_constraint of rec_elem_constraint_isolated is
  type t_sample is record
    value   : bit_vector;
    samples : bit_vector;
  end record;
  -- First: index_constraint on a wide field
  -- Second: index_constraint on a narrow field
  signal s : t_sample(value(0 to 127), samples(0 to 3))
    := (value => (others => '0'), samples => "0000");
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      s.value <= s.value(1 to 127) & '1';
    end if;
  end process;
  result <= s.value'length;
end architecture isolate_elem_constraint;
