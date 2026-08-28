-- =============================================================
-- Case ID: TC_SIMPLE_CONFIGURATION_SPECIFICATION_SMN_2
-- Related Rule ID: SEM_SIMPLE_C_001
-- Rule Type: Semantic
-- BNF Production: SIMPLE_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: simple_configuration_specification ::= for component_specification binding_indication [ ; ] end for [ ; ]
-- Case Type: Negative
-- Test Focus: Semantic error — simple configuration specification binds a component to an entity, but the component port types differ from the bound entity port types. The component declares a port of type bit while the bound entity's corresponding port is of type bit_vector, creating a semantic type mismatch at elaboration
-- Expected Result: Triggers semantic error: port type mismatch between component declaration and bound entity
-- Dependencies: None
-- =============================================================
entity scs_sem1_ent is
  port(din : in bit; dout : out bit);
end entity scs_sem1_ent;

architecture bh of scs_sem1_ent is
  component buf_entity is
    port(d : in bit; q : out bit);
  end component buf_entity;

  -- ERROR: semantic mismatch — the component declares port "d" as bit,
  -- but the bound entity "buf_entity_wide" has port "d" as bit_vector(3 downto 0)
  for u_buf : buf_entity use entity work.buf_entity_wide(rtl)
    port map(d => din, q => dout);
  end for;
begin
  u_buf : buf_entity port map(d => din, q => dout);
end architecture bh;
