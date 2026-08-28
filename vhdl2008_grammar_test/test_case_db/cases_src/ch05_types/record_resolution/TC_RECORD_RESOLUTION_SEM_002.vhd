-- =============================================================
-- Case ID: TC_RECORD_RESOLUTION_SEM_002
-- Related Rule ID: SEM_RECORD_R_002
-- Rule Type: Semantic
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_resolution ::= record_element_resolution { , record_element_resolution }
-- Case Type: Positive
-- Test Focus: SEMANTIC -- record resolution with multiple element
--            resolutions. Each field of the record gets its own
--            resolution function. Tests that multiple resolution
--            indications compose correctly within a single record.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity rec_res_sem_multi_resolve is
  port (
    dout : out integer
  );
end entity rec_res_sem_multi_resolve;
architecture rtl of rec_res_sem_multi_resolve is
  function resolve_bit(v : bit_vector) return bit is
    variable r : bit := '0';
  begin for i in v'range loop if v(i) = '1' then r := '1'; end if; end loop; return r;
  end function;
  function resolve_int(v : int_vec) return integer is
    variable s : integer := 0;
  begin for i in v'range loop s := s + v(i); end loop; return s / v'length; end function;
  subtype rbit is resolve_bit bit;
  type int_vec is array (natural range <>) of integer;
  subtype rint is resolve_int integer;
  type t_sensor is record
    active : rbit;
    reading : rint;
  end record;
  signal s_sensor : t_sensor := (active => '0', reading => 0);
begin
  s_sensor.active <= '1';
  s_sensor.reading <= 100;
  dout <= s_sensor.reading;
end architecture rtl;
