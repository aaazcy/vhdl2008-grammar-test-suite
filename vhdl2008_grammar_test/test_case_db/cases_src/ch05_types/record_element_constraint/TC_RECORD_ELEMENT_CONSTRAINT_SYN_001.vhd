-- =============================================================
-- Case ID: TC_RECORD_ELEMENT_CONSTRAINT_SYN_001
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_element_constraint ::= record_element_simple_name element_constraint
-- Test Focus: Element constraint with an index constraint on a
--   bit_vector record field. The element name "count" followed by an
--   array_constraint demonstrates the basic record_element_simple_name
--   + element_constraint structure.
-- Expected Result: Compiles; array field constrained to subrange
-- Dependencies: None
-- =============================================================
entity rec_elem_constraint_integer is
  port (
    clk   : in  bit;
    val   : out integer
  );
end entity rec_elem_constraint_integer;

architecture elem_int_constraint of rec_elem_constraint_integer is
  type t_rec is record
    count : bit_vector;
    ready : bit;
  end record;
  -- record_element_constraint: "count" is the simple_name,
  -- "(0 to 63)" is the element_constraint
  signal s : t_rec(count(0 to 63)) := (count => (others => '0'), ready => '0');
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      s.count <= s.count(1 to 63) & '1';
    end if;
  end process;
  val <= s.count'length;
end architecture elem_int_constraint;
