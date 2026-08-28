-- =============================================================
-- Case ID: TC_UNBOUNDED_ARRAY_DEFINITION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_UNBOUNDED_ARRAY_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: unbounded_array_definition ::=
--   array ( index_subtype_definition { , index_subtype_definition } )
--   of element_subtype_indication
-- Case Type: Positive
-- Test Focus: Three unbounded arrays in one architecture with
--            different dimensions and element types. An AES
--            encryption round state with key schedule.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity aes_round_state is
  port (
    round_num : in  integer range 0 to 10;
    byte_sel  : in  integer range 0 to 15;
    state_byte: out integer range 0 to 255;
    key_byte  : out integer range 0 to 255
  );
end entity aes_round_state;

architecture rtl of aes_round_state is
  -- 1D unbounded array for state bytes
  type state_vec is array (integer range <>) of integer range 0 to 255;
  subtype aes_state is state_vec(0 to 15);

  -- 2D unbounded array for round keys
  type key_schedule is array (integer range <>, integer range <>)
    of integer range 0 to 255;
  subtype round_keys is key_schedule(0 to 10, 0 to 15);

  -- 1D unbounded array for S-box
  type sbox_t is array (integer range <>) of integer range 0 to 255;

  signal state  : aes_state  := (others => 0);
  signal rkeys  : round_keys := (others => (others => 0));
begin
  state_byte <= state(byte_sel);
  key_byte   <= rkeys(round_num, byte_sel);
end architecture rtl;
