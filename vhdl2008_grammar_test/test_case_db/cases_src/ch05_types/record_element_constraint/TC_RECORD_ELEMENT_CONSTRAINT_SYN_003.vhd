-- =============================================================
-- Case ID: TC_RECORD_ELEMENT_CONSTRAINT_SYN_003
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_element_constraint ::= record_element_simple_name element_constraint
-- Test Focus: Element constraint using the "open" keyword for an
--   unconstrained array element. The element_constraint can be
--   "open" for array types, leaving them fully unconstrained.
-- Expected Result: Compiles; array field left open
-- Dependencies: None
-- =============================================================
entity rec_elem_constraint_open is
  port (
    clk   : in  bit;
    idx   : in  integer range 0 to 7;
    bit_out : out bit
  );
end entity rec_elem_constraint_open;

architecture elem_open_constraint of rec_elem_constraint_open is
  type t_flex is record
    tag   : integer;
    block_data : bit_vector;
  end record;
  -- "open" leaves block_data fully unconstrained
  subtype t_flex_open is t_flex(block_data(open));
  signal s : t_flex_open(block_data(0 to 7)) := (tag => 1, block_data => "00000000");
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      bit_out <= s.block_data(idx);
    end if;
  end process;
end architecture elem_open_constraint;
