-- =============================================================
-- Case ID: TC_ARRAY_ELEMENT_RESOLUTION_SMN_002
-- Rule Type: Static Model
-- Related Rule ID: BNF_ARRAY_ELEMENT_RESOLUTION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_element_resolution ::= resolution_indication
-- Case Type: Negative
-- Test Focus: Static model negative — resolution function return type
--            mismatch. A resolution function for an array element must
--            return the element subtype. Here the function returns
--            integer but the array element type is bit, causing a
--            type mismatch at the resolution_indication.
-- Expected Result: Triggers type mismatch error at elaboration
-- Dependencies: None
-- =============================================================
entity element_resolution_type_err is
  port (
    dout : out bit
  );
end entity element_resolution_type_err;

architecture rtl of element_resolution_type_err is
  function resolve_bit(v : bit_vector) return integer is  -- ERROR: return type should be bit
  begin
    return 0;
  end function;
  subtype resolved_bit is resolve_bit bit;  -- resolution function returns wrong type
  type resolved_vec is array (0 to 7) of resolved_bit;
  signal s : resolved_vec;
begin
  dout <= '0';
end architecture rtl;
