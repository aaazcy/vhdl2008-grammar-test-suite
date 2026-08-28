-- =============================================================
-- Case ID: TC_RECORD_ELEMENT_RESOLUTION_SMN_002
-- Related Rule ID: SMN_RECORD_E_002
-- Rule Type: Static Model
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_element_resolution ::= record_element_simple_name resolution_indication
-- Case Type: Negative
-- Test Focus: Static model negative -- record element resolution
--            with a resolution function whose parameter profile does
--            not match the element type. The function expects
--            bit_vector but the element is integer.
-- Expected Result: Triggers type mismatch error
-- Dependencies: None
-- =============================================================
entity rec_elem_res_smn_type_err is
  port ( dout : out integer );
end entity rec_elem_res_smn_type_err;
architecture rtl of rec_elem_res_smn_type_err is
  function resolve_bit(v : bit_vector) return bit is
    variable r : bit := '0';
  begin for i in v'range loop if v(i) = '1' then r := '1'; end if; end loop; return r;
  end function;
  subtype rint is resolve_bit integer;  -- ERROR: resolution returns bit, not integer
  type t_bad is record
    val : rint;
  end record;
  signal s : t_bad;
begin
  dout <= 0;
end architecture rtl;
