-- =============================================================
-- Case ID: TC_EXTERNAL_VARIABLE_NAME_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_VARIABLE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_variable_name ::= << variable external_pathname : subtype_indication >>
-- Case Type: Positive
-- Test Focus: External variable name using a relative_pathname — alias parent_pending is <<variable ^.^.sequencer.pending_cnt : natural>> accesses the pending variable in the sequencer process two levels up through ^, verifying the syntax of the relative path in external_variable_name
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ext_var_rel_path is
  port(poll : in bit; pending_out : out natural);
end entity;

architecture vhdl2008 of ext_var_rel_path is
  alias parent_pending is <<variable ^.^.sequencer.pending_cnt : natural>>;
  signal snap : natural := 0;
begin
  process(poll)
  begin
    if rising_edge(poll) then snap <= parent_pending; end if;
  end process;
  pending_out <= snap;
end architecture vhdl2008;
