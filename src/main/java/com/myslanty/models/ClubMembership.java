package com.myslanty.models;

public class ClubMembership {
    private int userId, clubId, privId;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getClubId() {
        return clubId;
    }

    public void setClubId(int clubId) {
        this.clubId = clubId;
    }

    public int getPrivId() {
        return privId;
    }

    public void setPrivId(int privId) {
        this.privId = privId;
    }
}
