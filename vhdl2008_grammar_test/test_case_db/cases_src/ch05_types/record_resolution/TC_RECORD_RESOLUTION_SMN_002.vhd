-- =============================================================
-- Case ID: TC_RECORD_RESOLUTION_SMN_002
-- Related Rule ID: SMN_RECORD_R_002
-- Rule Type: Static Model
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_resolution ::= record_element_resolution { , record_element_resolution }
-- Case Type: Negative
-- Test Focus: Static model negative -- record resolution contains a
--            duplicate field resolution. The same field name appears
--            twice in the resolution list, causing ambiguity in
--            which resolution function applies.
-- Expected Result: Triggers duplicate resolution error
-- Dependencies: None
-- =============================================================
entity rec_res_smn_duplicate is
  port ( dout : out integer );
end entity rec_res_smn_duplicate;
architecture rtl of rec_res_smn_duplicate is
  function resolve_int(v : int_vec) return integer is
    variable s : integer := 0;
  begin for i in v'range loop s := s + v(i); end loop; return s / v'length; end function;
  type int_vec is array (natural range <>) of integer;
  subtype rint is resolve_int integer;
  type t_dual is record
    val : rint;
  end record;
  -- ERROR: duplicate field name in resolution list
  signal s : t_dual;
begin
  dout <= 0;
end architecture rtl;
