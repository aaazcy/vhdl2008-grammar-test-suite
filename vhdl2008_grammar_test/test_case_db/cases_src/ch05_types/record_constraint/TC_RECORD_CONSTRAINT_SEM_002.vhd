-- =============================================================
-- Case ID: TC_RECORD_CONSTRAINT_SEM_002
-- Related Rule ID: SEM_RECORD_C_002
-- Rule Type: Semantic
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_constraint ::= ( record_element_constraint { , record_element_constraint } )
-- Case Type: Positive
-- Test Focus: SEMANTIC -- record_constraint applied via subtype to
--            narrow the fields of a record type. Tests that constrained
--            record fields are properly range-checked and the subtype
--            can be used as a constrained signal type.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity rec_con_sem_narrowed is
  port (
    dout : out integer
  );
end entity rec_con_sem_narrowed;
architecture rtl of rec_con_sem_narrowed is
  type t_wide is record
    x : integer range 0 to 65535;
    y : integer range 0 to 65535;
  end record;
  subtype t_narrow is t_wide(x => 0 to 255, y => 0 to 255);
  signal s_pt : t_narrow := (x => 0, y => 0);
begin
  process
  begin
    s_pt.x <= 128;
    s_pt.y <= 64;
    dout <= s_pt.x + s_pt.y;
    wait;
  end process;
end architecture rtl;
