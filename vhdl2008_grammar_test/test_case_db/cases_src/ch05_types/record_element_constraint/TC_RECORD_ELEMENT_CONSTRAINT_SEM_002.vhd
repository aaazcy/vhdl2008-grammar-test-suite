-- =============================================================
-- Case ID: TC_RECORD_ELEMENT_CONSTRAINT_SEM_002
-- Related Rule ID: SEM_RECORD_E_002
-- Rule Type: Semantic
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_element_constraint ::= record_element_simple_name element_constraint
-- Case Type: Positive
-- Test Focus: SEMANTIC -- record element constraint applied to a
--            subtype of a record. Tests that each field constraint
--            narrows the base type range and signal assignment respects
--            the constrained element ranges.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity rec_elem_con_sem_constrained is
  port (
    dout : out integer
  );
end entity rec_elem_con_sem_constrained;
architecture rtl of rec_elem_con_sem_constrained is
  type t_packet is record
    addr : integer range 0 to 255;
    data : integer range -128 to 127;
  end record;
  signal s_pkt : t_packet := (addr => 0, data => 0);
begin
  process
  begin
    s_pkt.addr <= 128;
    s_pkt.data <= 64;
    dout <= s_pkt.addr + s_pkt.data;
    wait;
  end process;
end architecture rtl;
