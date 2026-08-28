-- =============================================================
-- Case ID: TC_ASSOCIATION_ELEMENT_SNN_004
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_ASSOCIATION_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: association_element ::= [ formal_part => ] actual_part
-- Case Type: Negative
-- Test Focus: association_element — ERROR: using ':=' instead of '=>'
--             as the association delimiter. The BNF specifies '=>' as
--             the token connecting formal_part to actual_part.
--             ':=' is the variable/signal assignment operator, not
--             valid in port map associations.
-- Expected Result: Triggers syntax error (wrong delimiter :=)
-- Dependencies: None
-- =============================================================

entity association_element_snn4 is
  port (
    a : in  bit;
    b : out bit
  );
end entity association_element_snn4;

architecture arch of association_element_snn4 is

  component buffer_gate is
    port (
      a_in  : in  bit;
      y_out : out bit
    );
  end component;

  signal s_bit : bit;

begin

  -- ERROR: ':=' is the variable/signal assignment operator, NOT
  -- the association delimiter. The BNF requires '=>' between
  -- formal_part and actual_part in an association_element.
  -- Using ':=' creates a syntax error because ':=' is only valid
  -- in signal/variable assignment statements, not port maps.
  u_buf : component buffer_gate
    port map (
      a_in  := a,
      y_out := s_bit
    );

  b <= s_bit;

end architecture arch;
