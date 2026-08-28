-- =============================================================
-- Case ID: TC_CONCURRENT_SELECTED_SIGNAL_ASSIGNMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_SELECTED_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Production: concurrent_selected_signal_assignment ::= with expression select [ ? ] target <= [ guarded ] [ delay_mechanism ] selected_waveforms ;
-- Case Type: Positive
-- Test Focus: 4-to-1 select mapping ALU operations — the expression is the opcode bit_vector, and each when branch corresponds to one ALU operation, verifying that a selected assignment is used for multi-way parallel selection
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cssa_alu_ent is
  port(a, b : in bit_vector(3 downto 0); op : in bit_vector(1 downto 0); y : out bit_vector(3 downto 0));
end entity cssa_alu_ent;
architecture bh of cssa_alu_ent is
begin
  with op select
    y <= a and b when "00",
         a or b  when "01",
         a xor b when "10",
         not a   when "11",
         "0000"  when others;
end architecture bh;
