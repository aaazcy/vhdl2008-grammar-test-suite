-- =============================================================
-- Case ID: TC_RECORD_CONSTRAINT_SYN_005
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_constraint ::= ( record_element_constraint { , record_element_constraint } )
-- Test Focus: Record constraint with an index-constrained bit_vector
--   element alongside integer and enumerated elements. Exercises the
--   constraint list across heterogeneous field types.
-- Expected Result: Compiles; all field constraints applied
-- Dependencies: None
-- =============================================================
entity record_constraint_heterogeneous is
  port (
    clk   : in  bit;
    status : out bit
  );
end entity record_constraint_heterogeneous;

architecture hetero_constraint of record_constraint_heterogeneous is
  type t_port_status is (OPEN_STATE, CLOSED, FAULT);
  type t_port_rec is record
    port_id   : integer;
    data_bus  : bit_vector;
    state     : t_port_status;
  end record;
  signal port_info : t_port_rec(data_bus(0 to 31))
    := (port_id => 7, data_bus => (others => '0'), state => CLOSED);
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      if port_info.state = CLOSED then
        port_info.state <= OPEN_STATE;
      end if;
    end if;
  end process;
  status <= '1' when port_info.state = OPEN_STATE else '0';
end architecture hetero_constraint;
