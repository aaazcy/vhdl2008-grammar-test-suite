-- =============================================================
-- Case ID: TC_ENTITY_DESIGNATOR_SNN_006
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_ENTITY_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_designator ::= entity_tag [ signature ]
-- Case Type: Negative
-- Test Focus: Empty signature brackets [] -- the signature between brackets must contain at least one type_mark; empty brackets are not a valid signature in VHDL 2008 and violate the signature grammar
-- Expected Result: Triggers syntax error (empty signature)
-- Dependencies: None
-- =============================================================
entity ed_snn6_empty_sig is
  port(
    din  : in  bit_vector(3 downto 0);
    dout : out bit_vector(3 downto 0)
  );
end entity;

architecture bh of ed_snn6_empty_sig is
  attribute keep_hierarchy : boolean;
  function f_buf(v : bit_vector(3 downto 0)) return bit_vector is
  begin return v; end function;
  -- ERROR: empty brackets [] are not a valid signature
  attribute keep_hierarchy of f_buf [] : function is true;
  signal buf : bit_vector(3 downto 0) := "0000";
begin
  buf  <= din;
  dout <= f_buf(buf);
end architecture bh;
