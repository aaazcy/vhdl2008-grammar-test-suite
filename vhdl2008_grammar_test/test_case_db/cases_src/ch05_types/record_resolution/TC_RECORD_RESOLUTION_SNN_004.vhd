-- =============================================================
-- Case ID: TC_RECORD_RESOLUTION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_RECORD_RESOLUTION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_resolution ::= record_element_resolution { , record_element_resolution }
-- Case Type: Negative
-- Test Focus: Syntax error -- record resolution with duplicate comma
--            between element resolutions. A doubled comma (,,) in
--            the resolution list is a syntax error.
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity rec_res_snn_double_comma is
end entity rec_res_snn_double_comma;
architecture rtl of rec_res_snn_double_comma is
  function rbit(v : bit_vector) return bit is begin return '0'; end;
  function rint(v : int_vec) return integer is begin return 0; end;
  type int_vec is array (natural range <>) of integer;
  type t_rec is record
    flag : rbit bit;
    val  : rint integer;
  end record;
  signal s : t_rec;
begin
end architecture rtl;
