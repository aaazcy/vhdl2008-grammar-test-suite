-- =============================================================
-- Case ID: TC_ASSOCIATION_LIST_SNN_001
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_ASSOCIATION_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: association_list ::= association_element
--              { , association_element }
-- Case Type: Negative
-- Test Focus: association_list — ERROR: missing comma separator
--             between two association_elements. The BNF requires
--             commas between elements; adjacent elements without
--             a comma violate the grammar.
-- Expected Result: Triggers syntax error (missing comma)
-- Dependencies: None
-- =============================================================

entity association_list_snn1 is
  port (
    a : in  bit;
    b : out bit
  );
end entity association_list_snn1;

architecture arch of association_list_snn1 is

  component and_gate is
    port (
      x : in  bit;
      y : in  bit;
      z : out bit
    );
  end component;

  signal s_a : bit := '0';
  signal s_b : bit := '0';
  signal s_z : bit;

begin

  s_a <= a;
  s_b <= a;

  -- ERROR: missing comma between the first and second association_elements.
  -- The BNF: association_list ::= association_element { , association_element }
  -- requires the comma as a separator. Without it, 'y => s_b' looks like
  -- a second element attached to 'x => s_a' with no delimiter.
  u_and : component and_gate
    port map (
      x => s_a
      y => s_b,
      z => s_z
    );

  b <= s_z;

end architecture arch;
