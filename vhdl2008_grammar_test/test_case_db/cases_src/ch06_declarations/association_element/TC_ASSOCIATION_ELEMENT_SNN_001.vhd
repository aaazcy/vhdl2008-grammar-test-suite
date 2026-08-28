-- =============================================================
-- Case ID: TC_ASSOCIATION_ELEMENT_SNN_001
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_ASSOCIATION_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: association_element ::= [ formal_part => ] actual_part
-- Case Type: Negative
-- Test Focus: association_element — ERROR: missing the '=>' token
--             between formal_part and actual_part. The BNF requires
--             the '=>' delimiter in named associations. Using just a
--             space (or comma) between the formal port name and the
--             actual signal is a syntax error.
-- Expected Result: Triggers syntax error (missing =>)
-- Dependencies: None
-- =============================================================

entity association_element_snn1 is
  port (
    a : in  bit;
    b : out bit
  );
end entity association_element_snn1;

architecture arch of association_element_snn1 is

  component not_gate is
    port (
      input  : in  bit;
      output : out bit
    );
  end component;

  signal s_data : bit;

begin

  -- ERROR: 'input a' is missing the '=>' token.
  -- The BNF association_element ::= [ formal_part => ] actual_part
  -- requires the '=>' between formal_part and actual_part when
  -- a formal_part is present. Writing 'input a' without '=>'
  -- is not valid VHDL syntax.
  u_not : component not_gate
    port map (
      input a,
      output => s_data
    );

  b <= s_data;

end architecture arch;
